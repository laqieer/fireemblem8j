	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807F3F8, "ax", %progbits
@ sub_807F3F8 @ JP 0x0807F3F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F3F8
	.thumb_func
sub_807F3F8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807F438 @ =0x08A14068
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807F43C @ =0x0202BCAC
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F438: .4byte 0x08A14068
_0807F43C: .4byte 0x0202BCAC

