	.syntax unified
	.set AP_Delete, 0x08009194 + 1
	.set CountProcs, 0x08003448 + 1
	.set sub_80C7498, 0x080C7498 + 1
	.section .text.sub_80C74E0, "ax", %progbits
@ sub_80C74E0 @ JP 0x080C74E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C74E0
	.thumb_func
sub_80C74E0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl AP_Delete
	ldr r0, [r4, #0x2c]
	bl AP_Delete
	ldr r0, _080C7504 @ =0x08AC2608
	bl CountProcs
	cmp r0, #1
	bne _080C74FE
	bl sub_80C7498
_080C74FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7504: .4byte 0x08AC2608

