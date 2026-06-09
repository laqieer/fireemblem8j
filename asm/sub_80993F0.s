	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80993F0, "ax", %progbits
@ sub_80993F0 @ JP 0x080993F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80993F0
	.thumb_func
sub_80993F0:
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _08099420 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _0809942E
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
_0809940A:
	ldr r1, [r2]
	cmp r1, #0
	beq _08099426
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne _08099424
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b _08099430
	.align 2, 0
_08099420: .4byte 0x08A94430
_08099424:
	adds r4, #1
_08099426:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble _0809940A
_0809942E:
	movs r0, #0
_08099430:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

