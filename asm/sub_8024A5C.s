	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_801729C, 0x0801729C + 1
	.section .text.sub_8024A5C, "ax", %progbits
@ sub_8024A5C @ JP 0x08024A5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024A5C
	.thumb_func
sub_8024A5C:
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	ldr r0, _08024A98 @ =0x0202BCAC
	ldrh r0, [r0, #0x2c]
	bl sub_801729C
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08024A9C @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08024A98: .4byte 0x0202BCAC
_08024A9C: .4byte 0x02022CA8

