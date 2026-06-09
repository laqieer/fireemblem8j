	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807E4F0, "ax", %progbits
@ sub_807E4F0 @ JP 0x0807E4F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807E4F0
	.thumb_func
sub_807E4F0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807E550 @ =0x03003020
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x6a
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x4c
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x4c
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	adds r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xc
	ble _0807E54A
	mov r0, ip
	ldrb r1, [r0, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r5, #0
	bl sub_8002DE4
_0807E54A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E550: .4byte 0x03003020

