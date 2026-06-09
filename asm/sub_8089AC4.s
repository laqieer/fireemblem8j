	.syntax unified
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_80890BC, 0x080890BC + 1
	.set sub_8089910, 0x08089910 + 1
	.set sub_8089A00, 0x08089A00 + 1
	.section .text.sub_8089AC4, "ax", %progbits
@ sub_8089AC4 @ JP 0x08089AC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089AC4
	.thumb_func
sub_8089AC4:
	push {lr}
	ldr r0, _08089B0C @ =0x02003BFC
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089B14
	ldr r0, _08089B10 @ =0x081F548C
	bl sub_80890BC
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #5
	bl sub_8089A00
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #6
	bl sub_8089A00
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #7
	bl sub_8089A00
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #4
	bl sub_8089A00
	b _08089B4A
	.align 2, 0
_08089B0C: .4byte 0x02003BFC
_08089B10: .4byte 0x081F548C
_08089B14:
	ldr r0, _08089B54 @ =0x081F543C
	bl sub_80890BC
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl sub_8089A00
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #1
	bl sub_8089A00
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #2
	bl sub_8089A00
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #3
	bl sub_8089A00
_08089B4A:
	bl sub_8089910
	pop {r0}
	bx r0
	.align 2, 0
_08089B54: .4byte 0x081F543C

