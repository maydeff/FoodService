﻿using System;
using System.Collections.Generic;

namespace DatabaseModel
{
    public partial class TypeOfFood
    {
        public TypeOfFood()
        {
            FoodItem = new HashSet<FoodItem>();
        }

        public int TypeOfFoodId { get; set; }
        public string Name { get; set; }

        public ICollection<FoodItem> FoodItem { get; set; }
    }
}
