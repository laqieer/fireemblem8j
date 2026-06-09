	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807702C, 0x0807702C + 1
	.section .text.sub_8076744, "ax", %progbits
@ sub_8076744 @ JP 0x08076744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076744
	.thumb_func
sub_8076744:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6d
	ble _0807676A
	movs r0, #0
	strh r0, [r4, #0x2c]
	bl sub_807702C
	ldr r0, _08076770 @ =EkrLvupHBlank
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl sub_8002DE4
_0807676A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076770: .4byte 0x08076C6D  @ EkrLvupHBlank

