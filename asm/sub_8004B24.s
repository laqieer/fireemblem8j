	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.SpecialCharTest, "ax", %progbits
@ SpecialCharTest @ JP 0x08004B24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SpecialCharTest
	.thumb_func
SpecialCharTest:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_8000CD8
	adds r5, r0, #0
	movs r0, #0
	ldr r1, _08004B6C @ =0x02022CA8
	mov r8, r1
_08004B36:
	adds r7, r0, #1
	lsls r4, r0, #7
	movs r6, #0x1d
_08004B3C:
	mov r1, r8
	adds r0, r4, r1
	movs r2, #1
	ands r2, r5
	adds r5, #1
	movs r1, #0
	bl PutSpecialChar
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08004B3C
	adds r0, r7, #0
	cmp r0, #9
	ble _08004B36
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004B6C: .4byte 0x02022CA8

