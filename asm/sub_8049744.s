	.syntax unified
	.set PutNumber, 0x08004A90 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.section .text.sub_8049744, "ax", %progbits
@ sub_8049744 @ JP 0x08049744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049744
	.thumb_func
sub_8049744:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _08049790 @ =0x020234A8
	adds r0, r0, r1
	movs r1, #0
	adds r4, r2, #1
_08049758:
	adds r2, r1, #1
	movs r1, #5
_0804975C:
	strh r3, [r0]
	adds r0, #2
	adds r3, #1
	subs r1, #1
	cmp r1, #0
	bge _0804975C
	adds r0, #0x34
	adds r1, r2, #0
	cmp r1, #3
	ble _08049758
	adds r0, r6, #0
	bl sub_8003CF8
	lsls r0, r4, #5
	adds r0, #4
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _08049794 @ =0x02022CA8
	adds r0, r0, r1
	movs r1, #2
	ldr r2, [sp, #0x10]
	bl PutNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049790: .4byte 0x020234A8
_08049794: .4byte 0x02022CA8

