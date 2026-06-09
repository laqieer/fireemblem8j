	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_807CDE8, "ax", %progbits
@ sub_807CDE8 @ JP 0x0807CDE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CDE8
	.thumb_func
sub_807CDE8:
	push {r4, lr}
	adds r1, r0, #0
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _0807CE70 @ =0x0203E1EC
	adds r2, r0, #0
	adds r2, #0x5e
	ldrb r2, [r2]
	adds r3, r0, #0
	cmp r2, #1
	beq _0807CE12
	cmp r2, #2
	bne _0807CE22
	ldr r0, [r3, #0x18]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807CE12
	movs r4, #1
_0807CE12:
	ldr r0, [r3, #4]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807CE22
	movs r4, #0
_0807CE22:
	cmp r4, #0
	blt _0807CE6A
	ldr r0, _0807CE74 @ =0x08A13D80
	bl Proc_StartBlocking
	adds r3, r0, #0
	ldr r0, _0807CE70 @ =0x0203E1EC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #0x71
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	adds r0, #0x64
	strh r2, [r0]
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x71
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r2, r3, #0
	adds r2, #0x66
	strh r1, [r2]
	adds r0, r3, #0
	adds r0, #0x68
	strh r4, [r0]
_0807CE6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE70: .4byte 0x0203E1EC
_0807CE74: .4byte 0x08A13D80

