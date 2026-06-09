	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8007B24, "ax", %progbits
@ sub_8007B24 @ JP 0x08007B24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007B24
	.thumb_func
sub_8007B24:
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _08007B3E
	adds r0, r2, #0
	bl sub_8002DE4
	b _08007B42
_08007B3E:
	subs r0, r3, #1
	strh r0, [r1]
_08007B42:
	pop {r4}
	pop {r0}
	bx r0

