	.syntax unified
	.set AP_Update, 0x080091AC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807AFE0, "ax", %progbits
@ sub_807AFE0 @ JP 0x0807AFE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AFE0
	.thumb_func
sub_807AFE0:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x27
	ble _0807AFFA
	adds r0, r4, #0
	bl sub_8002DE4
_0807AFFA:
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	orrs r2, r3
	bl AP_Update
	pop {r4}
	pop {r0}
	bx r0

