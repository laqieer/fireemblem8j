	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806EA10, "ax", %progbits
@ sub_806EA10 @ JP 0x0806EA10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EA10
	.thumb_func
sub_806EA10:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0806EA3A
	ldr r0, [r4, #0x60]
	bl Proc_End
	adds r0, r4, #0
	bl sub_8002DE4
_0806EA3A:
	pop {r4}
	pop {r0}
	bx r0

