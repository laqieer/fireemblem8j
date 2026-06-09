	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8062024, 0x08062024 + 1
	.section .text.sub_8061FD8, "ax", %progbits
@ sub_8061FD8 @ JP 0x08061FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061FD8
	.thumb_func
sub_8061FD8:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08062018
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x44]
	bl sub_8062024
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08062018
	ldr r1, _08062020 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_08062018:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062020: .4byte 0x0201774C

