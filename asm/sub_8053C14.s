	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DisableEkrGauge, 0x08051F5C + 1
	.set EkrGauge_Clr4C50, 0x08051EB4 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set NewEkrNamewinAppear, 0x08057D98 + 1
	.set PlayDeathSoundForArena, 0x0805BE20 + 1
	.set UnAsyncEkrDispUP, 0x08052898 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800D474, 0x0800D474 + 1
	.set sub_8052C14, 0x08052C14 + 1
	.set sub_8053C9C, 0x08053C9C + 1
	.set sub_8057CAC, 0x08057CAC + 1
	.section .text.sub_8053C14, "ax", %progbits
@ efxDeadEvent_Loop_D @ JP 0x08053C14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxDeadEvent_Loop_D
	.thumb_func
efxDeadEvent_Loop_D:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_800D474
	adds r5, r0, #0
	cmp r5, #0
	bne _08053C6A
	bl PlayDeathSoundForArena
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_8053C9C
	bl sub_8052C14
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _08053C70 @ =0x0203E100
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	movs r1, #7
	bl sub_8057CAC
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl UnAsyncEkrDispUP
	bl EkrGauge_Clr4C50
	adds r0, r4, #0
	bl sub_8002DE4
_08053C6A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053C70: .4byte 0x0203E100

