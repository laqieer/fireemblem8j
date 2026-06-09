	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8083360, "ax", %progbits
@ sub_8083360 @ JP 0x08083360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083360
	.thumb_func
sub_8083360:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080833A0 @ =0x08A14D94
	adds r1, r2, #0
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _080833A4 @ =0x0202BCAC
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
_080833A0: .4byte 0x08A14D94
_080833A4: .4byte 0x0202BCAC

