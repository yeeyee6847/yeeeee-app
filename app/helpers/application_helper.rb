module ApplicationHelper
    def params_sort_column(default_column)
        params[:sort_column].present? ? Arel.sql(params[:sort_column]) : Arel.sql(default_column)
    end

    def params_sort_direction(default_direction)
        params[:sort_direction].present? ? Arel.sql(params[:sort_direction]) : Arel.sql(default_direction)
    end
    
    def sort_direction(column)
        column == params[:sort_column] && params[:sort_direction] == "asc" ? "desc" : "asc"
    end
end
