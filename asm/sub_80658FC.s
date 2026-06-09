	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80658FC, "ax", %progbits
@ sub_80658FC @ JP 0x080658FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80658FC
	.thumb_func
sub_80658FC:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_8012E84
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0806593A
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl sub_8002DE4
_0806593A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

