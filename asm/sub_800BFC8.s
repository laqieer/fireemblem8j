	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8050B14, 0x08050B14 + 1
	.section .text.sub_800BFC8, "ax", %progbits
@ sub_800BFC8 @ JP 0x0800BFC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BFC8
	.thumb_func
sub_800BFC8:
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl sub_8050B14
	cmp r0, #0
	bne _0800C0AC
	bl sub_80265CC
	movs r0, #0xf
	ands r0, r4
	cmp r0, #3
	beq _0800BFFC
	cmp r0, #3
	bgt _0800BFEC
	cmp r0, #2
	beq _0800BFF2
	b _0800C01C
_0800BFEC:
	cmp r0, #4
	beq _0800C010
	b _0800C01C
_0800BFF2:
	ldr r0, _0800BFF8 @ =0x085C7360
	b _0800BFFE
	.align 2, 0
_0800BFF8: .4byte 0x085C7360
_0800BFFC:
	ldr r0, _0800C00C @ =0x085C7380
_0800BFFE:
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	b _0800C01C
	.align 2, 0
_0800C00C: .4byte 0x085C7380
_0800C010:
	ldr r0, _0800C030 @ =0x085C7400
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
_0800C01C:
	lsrs r1, r4, #4
	movs r0, #0xf
	ands r1, r0
	cmp r1, #3
	beq _0800C044
	cmp r1, #3
	bgt _0800C034
	cmp r1, #1
	beq _0800C03A
	b _0800C064
	.align 2, 0
_0800C030: .4byte 0x085C7400
_0800C034:
	cmp r1, #4
	beq _0800C058
	b _0800C064
_0800C03A:
	ldr r0, _0800C040 @ =0x085C7340
	b _0800C046
	.align 2, 0
_0800C040: .4byte 0x085C7340
_0800C044:
	ldr r0, _0800C054 @ =0x085C7380
_0800C046:
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	b _0800C064
	.align 2, 0
_0800C054: .4byte 0x085C7380
_0800C058:
	ldr r0, _0800C078 @ =0x085C7400
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
_0800C064:
	lsrs r1, r4, #8
	movs r0, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0800C08C
	cmp r1, #2
	bgt _0800C07C
	cmp r1, #1
	beq _0800C082
	b _0800C0AC
	.align 2, 0
_0800C078: .4byte 0x085C7400
_0800C07C:
	cmp r1, #4
	beq _0800C0A0
	b _0800C0AC
_0800C082:
	ldr r0, _0800C088 @ =0x085C7340
	b _0800C08E
	.align 2, 0
_0800C088: .4byte 0x085C7340
_0800C08C:
	ldr r0, _0800C09C @ =0x085C7360
_0800C08E:
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	b _0800C0AC
	.align 2, 0
_0800C09C: .4byte 0x085C7360
_0800C0A0:
	ldr r0, _0800C0B4 @ =0x085C7400
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
_0800C0AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C0B4: .4byte 0x085C7400

