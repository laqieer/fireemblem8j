	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C3218, 0x080C3218 + 1
	.section .text.sub_80C7FFC, "ax", %progbits
@ sub_80C7FFC @ JP 0x080C7FFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7FFC
	.thumb_func
sub_80C7FFC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C8018 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r2, #0x1e
	bl sub_80C3218
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8018: .4byte 0x08AC1108

