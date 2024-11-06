my_model.keras:
	source venv/bin/activate; \
	python3 trainer.py

venv:
	python -m venv venv
	source venv/bin/activate; \
	pip install -r requirements.txt

# NOTE:
#  Even tho we are converting .webp files,
#   -due to the competency crisis-
#   some scrapped webp files will have
#   the wrong extension.
#   XXX: check for mimetype.
# Not tested:
#  fdupes -d -N $$i;
dataset:
	source venv/bin/activate; \
	python3 my_downloader.py
	for i in dataset/*; do \
		for h in $$i/*.webp; do \
			convert $$h $${h//.webp/.png} 2> /dev/null && rm $$h; \
		done; \
	done;

.PHONY: dataset venv
