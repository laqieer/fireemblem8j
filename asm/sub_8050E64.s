	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DisableEkrGauge, 0x08051F5C + 1
	.set EkrGauge_Clr4C50, 0x08051EB4 + 1
	.set NewEkrNamewinAppear, 0x08057D98 + 1
	.set UnAsyncEkrDispUP, 0x08052898 + 1
	.set sub_800D474, 0x0800D474 + 1
	.set sub_8052C14, 0x08052C14 + 1
	.set sub_8057CAC, 0x08057CAC + 1
	.section .text.sub_8050E64, "ax", %progbits
@ sub_8050E64 @ JP 0x08050E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050E64
	.thumb_func
sub_8050E64:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_800D474
	cmp r0, #0
	bne _08050E9C
	bl sub_8052C14
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
	ldr r0, _08050EA4 @ =sub_8050EA8
	str r0, [r4, #0xc]
_08050E9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050EA4: .4byte 0x08050EA9  @ sub_8050EA8

