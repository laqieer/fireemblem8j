	.syntax unified
	.set ApplyMapChangesById, 0x0802E4C4 + 1
	.set EnableMapChange, 0x0802E530 + 1
	.set UpdateRoofedUnits, 0x0802E5C8 + 1
	.set sub_801973C, 0x0801973C + 1
	.set sub_8019914, 0x08019914 + 1
	.section .text.sub_8087DFC, "ax", %progbits
@ sub_8087DFC @ JP 0x08087DFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087DFC
	.thumb_func
sub_8087DFC:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl ApplyMapChangesById
	movs r0, #1
	bl EnableMapChange
	bl sub_801973C
	bl UpdateRoofedUnits
	bl sub_8019914
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

