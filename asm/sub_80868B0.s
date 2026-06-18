	.syntax unified
	.section .text.sub_80868B0, "ax", %progbits
@ GetEventTriggerId @ JP 0x080868B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetEventTriggerId
	.thumb_func
GetEventTriggerId:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080868D8 @ =0x03001C78
	movs r2, #0x3c
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _080868EA
	adds r4, r1, #0
	movs r1, #0x80
	lsls r1, r1, #9
	adds r3, r0, #0
	adds r3, #0x28
	adds r2, r0, #0
	adds r5, r1, #0
_080868CC:
	ldr r0, [r2]
	cmp r0, r6
	bne _080868DC
	ldrh r0, [r3]
	b _080868EC
	.align 2, 0
_080868D8: .4byte 0x03001C78
_080868DC:
	adds r0, r1, #0
	adds r1, r1, r5
	adds r3, #2
	adds r2, #4
	asrs r0, r0, #0x10
	cmp r0, r4
	blt _080868CC
_080868EA:
	movs r0, #0
_080868EC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

