	.syntax unified
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_80176AC, "ax", %progbits
@ sub_80176AC @ JP 0x080176AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80176AC
	.thumb_func
sub_80176AC:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080176C2
	ldr r0, [r2, #4]
	ldrb r0, [r0, #6]
	b _080176EC
_080176C2:
	ldrb r0, [r2, #0x1c]
	bl sub_802EAC4
	ldrb r0, [r0, #3]
	cmp r0, #0x36
	beq _080176E2
	cmp r0, #0x36
	bgt _080176D8
	cmp r0, #0x35
	beq _080176DE
	b _080176EA
_080176D8:
	cmp r0, #0x37
	beq _080176E6
	b _080176EA
_080176DE:
	movs r0, #0x58
	b _080176EC
_080176E2:
	movs r0, #0x59
	b _080176EC
_080176E6:
	movs r0, #0x5a
	b _080176EC
_080176EA:
	movs r0, #0
_080176EC:
	pop {r1}
	bx r1

