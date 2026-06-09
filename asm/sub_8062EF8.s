	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8062EF8, "ax", %progbits
@ sub_8062EF8 @ JP 0x08062EF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062EF8
	.thumb_func
sub_8062EF8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08062F24 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062F28 @ =0x08600CA4
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _08062F2C @ =0x080E2AE4
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _08062F34
	ldr r0, _08062F30 @ =0x086A52F8
	b _08062F36
	.align 2, 0
_08062F24: .4byte 0x0201774C
_08062F28: .4byte 0x08600CA4
_08062F2C: .4byte 0x080E2AE4
_08062F30: .4byte 0x086A52F8
_08062F34:
	ldr r0, _08062F40 @ =0x086A54F8
_08062F36:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062F40: .4byte 0x086A54F8

