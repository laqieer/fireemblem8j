	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80567E0, "ax", %progbits
@ sub_80567E0 @ JP 0x080567E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80567E0
	.thumb_func
sub_80567E0:
	push {lr}
	adds r2, r1, #0
	ldr r1, _080567F8 @ =0x020228C8
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl sub_80D636C
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_080567F8: .4byte 0x020228C8

