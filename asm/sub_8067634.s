	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8067634, "ax", %progbits
@ sub_8067634 @ JP 0x08067634 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067634
	.thumb_func
sub_8067634:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08067674 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067678 @ =0x08601B98
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0806767C @ =0x080E3690
	str r1, [r0, #0x48]
	ldr r1, _08067680 @ =0x08601BD8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08067684 @ =0x08601BB0
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08067688 @ =0x0878CE88
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067674: .4byte 0x0201774C
_08067678: .4byte 0x08601B98
_0806767C: .4byte 0x080E3690
_08067680: .4byte 0x08601BD8
_08067684: .4byte 0x08601BB0
_08067688: .4byte 0x0878CE88

