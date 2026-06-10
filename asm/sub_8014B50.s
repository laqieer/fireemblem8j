	.syntax unified
	.set m4aMPlayImmInit, 0x080D50E4 + 1
	.set m4aMPlayPanpotControl, 0x080D5F78 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8014B28, 0x08014B28 + 1
	.section .text.sub_8014B50, "ax", %progbits
@ sub_8014B50 @ JP 0x08014B50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014B50
	.thumb_func
sub_8014B50:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08014BA0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014B6A
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014B6A:
	ldr r2, _08014BA4 @ =0x082140B4
	ldr r1, _08014BA8 @ =0x08214120
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08014BAC @ =0x0000FFFF
	adds r0, r6, #0
	bl sub_8014B28
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014BA0: .4byte 0x0202BCEC
_08014BA4: .4byte 0x082140B4
_08014BA8: .4byte 0x08214120
_08014BAC: .4byte 0x0000FFFF

