	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80B2BE4, "ax", %progbits
@ sub_80B2BE4 @ JP 0x080B2BE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2BE4
	.thumb_func
sub_80B2BE4:
	push {r4, lr}
	movs r3, #0x1f
	ands r1, r3
	ands r2, r3
	ldr r4, _080B2C04 @ =0x020228A8
	lsls r2, r2, #0xa
	lsls r1, r1, #5
	adds r2, r2, r1
	ands r3, r0
	adds r2, r2, r3
	strh r2, [r4]
	bl sub_8001EE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C04: .4byte 0x020228A8

