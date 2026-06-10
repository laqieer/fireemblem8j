	.syntax unified
	.section .text.sub_8042618, "ax", %progbits
@ sub_8042618 @ JP 0x08042618 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042618
	.thumb_func
sub_8042618:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08042664 @ =0x085D31E8
	ldr r3, [r0]
	ldr r0, _08042668 @ =0x00001B74
	adds r4, r3, r0
	ldrb r0, [r4]
	movs r6, #0x8c
	adds r5, r0, #0
	muls r5, r6, r5
	adds r0, r3, r5
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xcf
	bne _08042670
	ldr r1, _0804266C @ =0x030017E0
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r3, r0
	str r0, [r1]
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r3, r0
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r7]
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r2
	adds r0, r3, r0
	adds r0, #4
	b _08042672
	.align 2, 0
_08042664: .4byte 0x085D31E8
_08042668: .4byte 0x00001B74
_0804266C: .4byte 0x030017E0
_08042670:
	movs r0, #0
_08042672:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

