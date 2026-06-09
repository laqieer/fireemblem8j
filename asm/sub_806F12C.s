	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F12C, "ax", %progbits
@ sub_806F12C @ JP 0x0806F12C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F12C
	.thumb_func
sub_806F12C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806F14E
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0806F14E:
	pop {r4}
	pop {r0}
	bx r0

