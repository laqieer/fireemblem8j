	.syntax unified
	.set sub_8075E70, 0x08075E70 + 1
	.section .text.sub_8051968, "ax", %progbits
@ sub_8051968 @ JP 0x08051968 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051968
	.thumb_func
sub_8051968:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805197C @ =0x0203E1C4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08051984
	ldr r0, _08051980 @ =0x02000000
	ldr r0, [r0]
	b _08051988
	.align 2, 0
_0805197C: .4byte 0x0203E1C4
_08051980: .4byte 0x02000000
_08051984:
	ldr r0, _08051998 @ =0x02000000
	ldr r0, [r0, #8]
_08051988:
	bl sub_8075E70
	ldr r0, _0805199C @ =sub_80519A0
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051998: .4byte 0x02000000
_0805199C: .4byte 0x080519A1  @ sub_80519A0

