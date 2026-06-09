	.syntax unified
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_800783C, 0x0800783C + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80D24EC, "ax", %progbits
@ sub_80D24EC @ JP 0x080D24EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D24EC
	.thumb_func
sub_80D24EC:
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r2, r0, #0
	add r1, sp, #0x10
	ldr r0, _080D250C @ =0x081F6D2C
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrh r0, [r2, #0x2a]
	cmp r0, #0x12
	beq _080D2510
	cmp r0, #0x12
	ble _080D2518
	cmp r0, #0x18
	beq _080D2514
	b _080D2518
	.align 2, 0
_080D250C: .4byte 0x081F6D2C
_080D2510:
	movs r5, #1
	b _080D251A
_080D2514:
	movs r5, #2
	b _080D251A
_080D2518:
	movs r5, #0
_080D251A:
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r4, #0
	str r4, [sp]
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_800783C
	lsls r0, r5, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080D257C @ =0x06011800
	str r0, [sp, #4]
	movs r5, #1
	rsbs r5, r5, #0
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_80913FC
	movs r0, #0xa
	bl SetCgTextFlags
	ldr r1, _080D2580 @ =0x03004920
	ldr r2, [r1]
	movs r0, #0x82
	str r0, [r2, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1, #0x30]
	str r0, [r2, #0x30]
	str r0, [r3, #0x30]
	ldr r0, _080D2584 @ =0x03005388
	strb r5, [r0]
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D257C: .4byte 0x06011800
_080D2580: .4byte 0x03004920
_080D2584: .4byte 0x03005388

