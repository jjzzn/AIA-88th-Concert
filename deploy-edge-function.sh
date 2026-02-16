#!/bin/bash

# Deploy send-individual-tickets Edge Function to Supabase

echo "🚀 Deploying send-individual-tickets Edge Function..."

# Make sure you're in the project directory
cd "$(dirname "$0")"

# Deploy the function
supabase functions deploy send-individual-tickets --no-verify-jwt

echo "✅ Deployment complete!"
echo ""
echo "📋 Next steps:"
echo "1. Check deployment status in Supabase Dashboard"
echo "2. Test booking again"
echo "3. Check Edge Function logs"
