	.syntax unified
	.section .text.GetUnitFromCharIdAndFaction, "ax", %progbits
@ GetUnitFromCharIdAndFaction @ JP 0x08017FEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitFromCharIdAndFaction
	.thumb_func
GetUnitFromCharIdAndFaction:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r3, #0x40
	adds r1, #1
	cmp r1, r3
	bge _08018026
	ldr r6, _0801801C @ =0x085C2A50
	movs r5, #0xff
_08017FFE:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018020
	ldr r0, [r2]
	cmp r0, #0
	beq _08018020
	ldrb r0, [r0, #4]
	cmp r0, r4
	bne _08018020
	adds r0, r2, #0
	b _08018028
	.align 2, 0
_0801801C: .4byte 0x085C2A50
_08018020:
	adds r1, #1
	cmp r1, r3
	blt _08017FFE
_08018026:
	movs r0, #0
_08018028:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

