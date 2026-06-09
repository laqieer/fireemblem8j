	.syntax unified
	.section .text.HBlank_MapAnimBg2VOfs, "ax", %progbits
@ HBlank_MapAnimBg2VOfs @ JP 0x08084C2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_MapAnimBg2VOfs
	.thumb_func
HBlank_MapAnimBg2VOfs:
	push {lr}
	ldr r0, _08084C50 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _08084C3E
	movs r3, #0
_08084C3E:
	ldr r2, _08084C54 @ =0x0400001A
	ldr r0, _08084C58 @ =0x0203E758
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08084C50: .4byte 0x04000006
_08084C54: .4byte 0x0400001A
_08084C58: .4byte 0x0203E758

