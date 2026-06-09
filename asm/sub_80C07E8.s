	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C07E8, "ax", %progbits
@ sub_80C07E8 @ JP 0x080C07E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C07E8
	.thumb_func
sub_80C07E8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080C0864 @ =0x08AC1924
	adds r1, r4, #0
	bl sub_8002BCC
	adds r7, r0, #0
	str r5, [r7, #0x2c]
	adds r4, r7, #0
	adds r4, #0x30
	movs r2, #0
	strb r6, [r4]
	adds r0, #0x31
	mov r1, r8
	strb r1, [r0]
	ldr r0, [sp, #0x18]
	str r0, [r7, #0x3c]
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r1, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x33
	strb r2, [r0]
	ldr r0, _080C0868 @ =0x08B1CD80
	movs r1, #0xb
	bl AP_Create
	str r0, [r7, #0x38]
	movs r1, #1
	bl AP_SwitchAnimation
	ldr r3, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	lsrs r1, r1, #5
	ldrb r2, [r4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r1, r0
	strh r1, [r3, #0x22]
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C0864: .4byte 0x08AC1924
_080C0868: .4byte 0x08B1CD80

