	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807FB1C, "ax", %progbits
@ sub_807FB1C @ JP 0x0807FB1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FB1C
	.thumb_func
sub_807FB1C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807FB54 @ =0x08A1420C
	movs r1, #3
	bl sub_8002BCC
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807FB58 @ =0x0202BCAC
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB54: .4byte 0x08A1420C
_0807FB58: .4byte 0x0202BCAC

