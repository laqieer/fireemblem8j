	.syntax unified
	.set GetManimLevelUpStatGain, 0x08080F48 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set sub_8081070, 0x08081070 + 1
	.section .text.sub_8080EE4, "ax", %progbits
@ PutManimLevelUpStat @ JP 0x08080EE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutManimLevelUpStat
	.thumb_func
PutManimLevelUpStat:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r3, #0
	ldr r4, [sp, #0x18]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldr r3, _08080F40 @ =0x08A1455C
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r3, [r0, #1]
	adds r2, r2, r3
	lsls r2, r2, #5
	adds r2, #4
	ldrb r0, [r0]
	adds r1, r1, r0
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r0, _08080F44 @ =0x02022CA8
	adds r7, r2, r0
	mov r0, r8
	adds r1, r6, #0
	bl sub_8081070
	adds r5, r0, #0
	cmp r4, #0
	beq _08080F2A
	mov r0, r8
	adds r1, r6, #0
	bl GetManimLevelUpStatGain
	adds r5, r5, r0
_08080F2A:
	adds r0, r7, #0
	movs r1, #2
	adds r2, r5, #0
	bl PutNumberOrBlank
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080F40: .4byte 0x08A1455C
_08080F44: .4byte 0x02022CA8

