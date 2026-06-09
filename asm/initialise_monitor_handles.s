	.syntax unified
	.section .text.initialise_monitor_handles, "ax", %progbits
@ initialise_monitor_handles @ JP 0x080DA434 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global initialise_monitor_handles
	.thumb_func
initialise_monitor_handles:
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _080DA490 @ =0x085775A4
	str r4, [sp]
	movs r3, #3
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #1
	adds r0, r5, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r5, _080DA494 @ =0x03002B34
	str r2, [r5]
	str r4, [sp]
	str r3, [sp, #8]
	movs r0, #4
	str r0, [sp, #4]
	ldr r3, _080DA498 @ =0x03002B38
	movs r4, #1
	adds r0, r4, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r0, _080DA49C @ =0x03002B3C
	str r2, [r0]
	str r2, [r3]
	ldr r2, _080DA4A0 @ =0x03002B40
	adds r1, r2, #0
	subs r4, #2
	adds r0, r2, #0
	adds r0, #0x98
_080DA476:
	str r4, [r0]
	subs r0, #8
	cmp r0, r1
	bge _080DA476
	movs r0, #0
	ldr r1, [r5]
	str r1, [r2]
	str r0, [r2, #4]
	ldr r1, [r3]
	str r1, [r2, #8]
	str r0, [r2, #0xc]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_080DA490: .4byte 0x085775A4
_080DA494: .4byte 0x03002B34
_080DA498: .4byte 0x03002B38
_080DA49C: .4byte 0x03002B3C
_080DA4A0: .4byte 0x03002B40

