

import pandas as pd
from PIL import Image, ImageDraw, ImageFont
import os

base_path = "/mnt/data/ecommerce-funnel-retention-sql"
os.makedirs(base_path + "/sample_outputs", exist_ok=True)
os.makedirs(base_path + "/screenshots", exist_ok=True)

# Create funnel_metrics.csv
funnel_df = pd.DataFrame({
    "stage": ["Visit", "Add to Cart", "Purchase"],
    "users": [1000, 420, 180],
    "conversion_rate_percent": [100, 42, 18]
})
funnel_df.to_csv(base_path + "/sample_outputs/funnel_metrics.csv", index=False)

# Create retention_metrics.csv
retention_df = pd.DataFrame({
    "customer_type": ["One-time Buyers", "Repeat Buyers"],
    "customer_count": [140, 40],
    "percentage": [78, 22]
})
retention_df.to_csv(base_path + "/sample_outputs/retention_metrics.csv", index=False)

# Create channel_performance.csv
channel_df = pd.DataFrame({
    "acquisition_channel": ["Instagram", "Google Ads", "Referral"],
    "buyers": [60, 80, 40],
    "avg_order_value": [1150, 980, 1350]
})
channel_df.to_csv(base_path + "/sample_outputs/channel_performance.csv", index=False)

# Function to create placeholder images
def create_image(path, text):
    img = Image.new("RGB", (900, 500), color=(240, 240, 240))
    d = ImageDraw.Draw(img)
    d.text((50, 220), text, fill=(0, 0, 0))
    img.save(path)

create_image(base_path + "/screenshots/mysql_output.png", "MySQL Query Output Screenshot (Sample)")
create_image(base_path + "/screenshots/excel_dashboard.png", "Excel Funnel & Retention Dashboard (Sample)")

base_path
