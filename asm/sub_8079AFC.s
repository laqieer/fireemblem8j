	.syntax unified
	.set sub_8056964, 0x08056964 + 1
	.set sub_80734BC, 0x080734BC + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8079AFC, "ax", %progbits
@ sub_8079AFC @ JP 0x08079AFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079AFC
	.thumb_func
sub_8079AFC:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	asrs r4, r4, #3
	asrs r5, r5, #3
	movs r0, #0
	bl sub_8056964
	ldr r0, _08079B58 @ =0x02019790
	mov r8, r0
	adds r0, r6, #0
	mov r1, r8
	bl sub_80D6394
	movs r1, #1
	rsbs r1, r1, #0
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r2, _08079B5C @ =0x0201D428
	adds r0, r0, r2
	adds r4, r4, r0
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	mov r0, r8
	adds r2, r4, #0
	movs r3, #0x42
	bl sub_80734BC
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079B58: .4byte 0x02019790
_08079B5C: .4byte 0x0201D428

