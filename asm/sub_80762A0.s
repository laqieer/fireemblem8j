	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80762A0, "ax", %progbits
@ sub_80762A0 @ JP 0x080762A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80762A0
	.thumb_func
sub_80762A0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080762CC @ =EkrLvupHBlank
	bl SetPrimaryHBlankHandler
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080762CC: .4byte 0x08076C6D  @ EkrLvupHBlank

