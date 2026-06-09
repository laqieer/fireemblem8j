	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_80194BC, 0x080194BC + 1
	.section .text.sub_804A390, "ax", %progbits
@ sub_804A390 @ JP 0x0804A390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A390
	.thumb_func
sub_804A390:
	push {r4, lr}
	ldr r0, _0804A3E8 @ =0x0202E4D4
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _0804A3EC @ =0x0202E4E4
	ldr r0, [r0]
	movs r1, #1
	bl sub_80194BC
	movs r4, #1
_0804A3A8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0804A3DC
	ldr r0, [r2]
	cmp r0, #0
	beq _0804A3DC
	ldr r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0804A3DC
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _0804A3E8 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
_0804A3DC:
	adds r4, #1
	cmp r4, #0xc5
	ble _0804A3A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A3E8: .4byte 0x0202E4D4
_0804A3EC: .4byte 0x0202E4E4

