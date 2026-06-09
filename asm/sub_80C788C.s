	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80C77F8, 0x080C77F8 + 1
	.set sub_80C7864, 0x080C7864 + 1
	.section .text.sub_80C788C, "ax", %progbits
@ sub_80C788C @ JP 0x080C788C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C788C
	.thumb_func
sub_80C788C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r4, r1, #0
	bl sub_80C77F8
	mov r8, r0
	cmp r4, #0
	beq _080C78B0
	ldr r0, _080C78AC @ =0x08AC2608
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080C78B8
	.align 2, 0
_080C78AC: .4byte 0x08AC2608
_080C78B0:
	ldr r0, _080C7928 @ =0x08AC2608
	movs r1, #3
	bl sub_8002BCC
_080C78B8:
	adds r7, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl sub_80C7864
	ldr r1, _080C792C @ =0x081F67BC
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r5, #0
	movs r1, #0xd
	bl AP_Create
	str r0, [r7, #0x2c]
	mov r1, r8
	lsls r4, r1, #0xc
	asrs r4, r4, #5
	ldr r2, _080C7930 @ =0xFFFF9C00
	adds r1, r2, #0
	movs r2, #0
	mov sb, r2
	orrs r4, r1
	strh r4, [r0, #0x22]
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl AP_SwitchAnimation
	adds r0, r5, #0
	movs r1, #0xd
	bl AP_Create
	str r0, [r7, #0x34]
	strh r4, [r0, #0x22]
	ldr r0, [r7, #0x34]
	movs r1, #1
	bl AP_SwitchAnimation
	adds r0, r7, #0
	adds r0, #0x2a
	strb r6, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	subs r0, #2
	mov r2, sb
	strb r2, [r0]
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C7928: .4byte 0x08AC2608
_080C792C: .4byte 0x081F67BC
_080C7930: .4byte 0xFFFF9C00

