	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8009608, "ax", %progbits
@ sub_8009608 @ JP 0x08009608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009608
	.thumb_func
sub_8009608:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r1
	mov sb, r2
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl AP_Create
	adds r4, r0, #0
	adds r1, r5, #0
	bl AP_SwitchAnimation
	strh r6, [r4, #0x22]
	ldr r0, _0800964C @ =0x085B9424
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x54]
	mov r1, sb
	str r1, [r0, #0x58]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800964C: .4byte 0x085B9424

