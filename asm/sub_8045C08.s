	.syntax unified
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTalkFlag, 0x080069AC + 1
	.set SetTalkPrintDelay, 0x080069F4 + 1
	.set sub_800687C, 0x0800687C + 1
	.set sub_8006890, 0x08006890 + 1
	.set sub_8006A14, 0x08006A14 + 1
	.set sub_800773C, 0x0800773C + 1
	.set sub_800814C, 0x0800814C + 1
	.section .text.sub_8045C08, "ax", %progbits
@ sub_8045C08 @ JP 0x08045C08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045C08
	.thumb_func
sub_8045C08:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_800687C
	bl sub_800814C
	bl ResetTextFont
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl sub_8006890
	movs r0, #1
	bl sub_8006A14
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkPrintDelay
	movs r0, #1
	bl sub_800773C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

