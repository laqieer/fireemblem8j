	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80D26A8, "ax", %progbits
@ sub_80D26A8 @ JP 0x080D26A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D26A8
	.thumb_func
sub_80D26A8:
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r2, r0, #0
	add r1, sp, #0x10
	ldr r0, _080D26C8 @ =0x081F6D5C
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrh r0, [r2, #0x2a]
	cmp r0, #0x12
	beq _080D26CC
	cmp r0, #0x12
	ble _080D26D4
	cmp r0, #0x18
	beq _080D26D0
	b _080D26D4
	.align 2, 0
_080D26C8: .4byte 0x081F6D5C
_080D26CC:
	movs r0, #1
	b _080D26D6
_080D26D0:
	movs r0, #2
	b _080D26D6
_080D26D4:
	movs r0, #0
_080D26D6:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080D26F0
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
	b _080D270E
_080D26F0:
	str r0, [sp]
	ldr r0, _080D2718 @ =0x06011800
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_80913FC
	movs r0, #0xa
	bl SetCgTextFlags
_080D270E:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2718: .4byte 0x06011800

