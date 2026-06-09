	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set sub_80139E0, 0x080139E0 + 1
	.set sub_8013B3C, 0x08013B3C + 1
	.section .text.sub_8005DF4, "ax", %progbits
@ sub_8005DF4 @ JP 0x08005DF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005DF4
	.thumb_func
sub_8005DF4:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetPortraitData
	mov r8, r0
	ldr r6, _08005E38 @ =0x0202A688
	adds r5, r4, #0
	adds r5, #0x40
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	adds r0, #0x10
	bl sub_8013B3C
	mov r1, r8
	ldr r0, [r1, #8]
	ldrb r1, [r5]
	lsls r1, r1, #3
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	adds r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl sub_80139E0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005E38: .4byte 0x0202A688

