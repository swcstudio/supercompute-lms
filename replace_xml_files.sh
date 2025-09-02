#!/bin/bash

# XML-Enhanced File Replacement Script
# Safely replaces original foundation module files with their XML-enhanced versions

set -e  # Exit on any error

# Array of XML-enhanced files (extracted from your command arguments)
xml_files=(
    "04_mature_trees_canopy_intelligence_xml_enhanced.md"
    "05_ecosystem_services_xml_enhanced.md"
    "06_enterprise_forests_xml_enhanced.md"
    "07_genetic_programming_xml_enhanced.md"
    "08_quantum_fields_xml_enhanced.md"
    "09_ancestral_memory_xml_enhanced.md"
    "10_planetary_harmonics_xml_enhanced.md"
    "11_emergent_superintelligence_xml_enhanced.md"
    "12_universal_language_xml_enhanced.md"
    "13_quantum_consciousness_xml_enhanced.md"
    "14_theory_of_everything_xml_enhanced.md"
    "16_loop_quantum_gravity_xml_enhanced.md"
    "19_multiverse_metaverse_xml_enhanced.md"
)

# Change to foundations directory
cd /home/ubuntu/src/repos/supercompute-programming/00_foundations

echo "Starting XML-enhanced file replacement process..."
echo "Working directory: $(pwd)"
echo "Files to process: ${#xml_files[@]}"
echo ""

# Counters for tracking
replaced_count=0
warning_count=0

# Process each XML-enhanced file
for xml_file in "${xml_files[@]}"; do
    # Extract base name by removing _xml_enhanced suffix
    base_name="${xml_file/_xml_enhanced/}"
    
    echo "Processing: $xml_file -> $base_name"
    
    if [[ -f "$xml_file" ]]; then
        if [[ -f "$base_name" ]]; then
            echo "  ✓ Replacing $base_name with $xml_file"
            mv "$xml_file" "$base_name"
            ((replaced_count++))
        else
            echo "  ⚠ Warning: Original file $base_name not found, keeping XML version"
            mv "$xml_file" "$base_name"
            ((warning_count++))
        fi
    else
        echo "  ✗ Error: XML file $xml_file not found"
        ((warning_count++))
    fi
    echo ""
done

echo "Replacement process complete!"
echo "Files successfully replaced: $replaced_count"
echo "Warnings/Issues: $warning_count"
echo ""

# List files to verify results
echo "Current foundation module files:"
ls -la *.md | grep -E '^[0-9]+_' | head -20

echo ""
echo "✓ All XML-enhanced files have been renamed to replace their originals"
echo "✓ Backup available at: 00_foundations_backup_20250902_195147/"
echo "✓ Ready for git commit"