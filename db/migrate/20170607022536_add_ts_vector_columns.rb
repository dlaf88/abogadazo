class AddTsVectorColumns < ActiveRecord::Migration[5.0]
  def up
  	add_column :articles, :tsv_search, :tsvector
    add_index :articles, :tsv_search, using: "gin"

    execute <<-pencil
		CREATE FUNCTION articles_trigger() RETURNS trigger AS $$
		begin
			new.tsv_search :=
			setweight(to_tsvector('pg_catalog.spanish', unaccent(coalesce(new.title,''))), 'A') ||
			setweight(to_tsvector('pg_catalog.spanish', unaccent(coalesce(new.raw_body,''))), 'B');
			return new;
		end
		$$ LANGUAGE plpgsql;


		CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
		ON articles FOR EACH ROW EXECUTE PROCEDURE articles_trigger();
    pencil
  end


  def down
  	execute <<-THIS2
      DROP TRIGGER tsvectorupdate
      ON articles
    THIS2

    remove_index :articles, :tsv_search
    remove_column :articles, :tsv_search


  end 
end
