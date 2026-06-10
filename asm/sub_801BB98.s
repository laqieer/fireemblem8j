	.syntax unified
	.set GetGlobalCompletionCount, 0x080A95F4 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.section .text.sub_801BB98, "ax", %progbits
@ sub_801BB98 @ JP 0x0801BB98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BB98
	.thumb_func
sub_801BB98:
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r3, _0801BBF0 @ =0x080DC6E8
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl sub_80043B8
	ldr r3, _0801BBF4 @ =0x080DC6F0
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl sub_80043B8
	bl GetGlobalCompletionCount
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl sub_80043DC
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BBF8 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BBF0: .4byte 0x080DC6E8
_0801BBF4: .4byte 0x080DC6F0
_0801BBF8: .4byte 0x02022CA8

