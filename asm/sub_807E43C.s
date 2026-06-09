	.syntax unified
	.set DrawMAExpBar, 0x0807E308 + 1
	.set __modsi3, 0x080D6690 + 1
	.set m4aSongNumStop, 0x080D4FC0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807E43C, "ax", %progbits
@ sub_807E43C @ JP 0x0807E43C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807E43C
	.thumb_func
sub_807E43C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x63
	ble _0807E456
	movs r0, #0
	strh r0, [r4]
_0807E456:
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #6
	movs r1, #8
	bl DrawMAExpBar
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x64
	bl __modsi3
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0807E488
	adds r0, r5, #0
	bl sub_8002DE4
	movs r0, #0x74
	bl m4aSongNumStop
_0807E488:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

